/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct MilkyData : Codable {
	let center : String?
	let title : String?
	let photographer : String?
	let keywords : [String]?
	let nasa_id : String?
	let media_type : String?
	let date_created : String?
	let description : String?

	enum CodingKeys: String, CodingKey {

		case center = "center"
		case title = "title"
		case photographer = "photographer"
		case keywords = "keywords"
		case nasa_id = "nasa_id"
		case media_type = "media_type"
		case date_created = "date_created"
		case description = "description"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		center = try values.decodeIfPresent(String.self, forKey: .center)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		photographer = try values.decodeIfPresent(String.self, forKey: .photographer)
		keywords = try values.decodeIfPresent([String].self, forKey: .keywords)
		nasa_id = try values.decodeIfPresent(String.self, forKey: .nasa_id)
		media_type = try values.decodeIfPresent(String.self, forKey: .media_type)
		date_created = try values.decodeIfPresent(String.self, forKey: .date_created)
		description = try values.decodeIfPresent(String.self, forKey: .description)
	}

}
